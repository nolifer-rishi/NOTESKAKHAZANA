// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title NOTES KA KHAZANA
 * @dev A simple contract to store short notes and memos on-chain.
 * Each user (address) can save, view, and delete their own notes.
 */
contract NOTES_KA_KHAZANA {

    // Structure to represent a note
    struct Note {
        uint256 id;
        string content;
        uint256 timestamp;
    }

    // Mapping of user address => array of notes
    mapping(address => Note[]) private userNotes;

    // Event when a new note is added
    event NoteAdded(address indexed user, uint256 noteId, string content, uint256 timestamp);

    // Event when a note is deleted
    event NoteDeleted(address indexed user, uint256 noteId);

    /**
     * @dev Function to add a new note
     * @param _content The text content of the note
     */
    function addNote(string calldata _content) external {
        require(bytes(_content).length > 0, "Note cannot be empty");

        uint256 newId = userNotes[msg.sender].length;
        userNotes[msg.sender].push(Note(newId, _content, block.timestamp));

        emit NoteAdded(msg.sender, newId, _content, block.timestamp);
    }

    /**
     * @dev Function to get all notes for the caller
     * @return An array of Note structs
     */
    function getMyNotes() external view returns (Note[] memory) {
        return userNotes[msg.sender];
    }

    /**
     * @dev Function to delete a specific note by its ID
     * @param _noteId The ID of the note to delete
     */
    function deleteNote(uint256 _noteId) external {
        require(_noteId < userNotes[msg.sender].length, "Invalid note ID");

        delete userNotes[msg.sender][_noteId];

        emit NoteDeleted(msg.sender, _noteId);
    }

    /**
     * @dev Get total number of notes created by the caller
     */
    function getMyNoteCount() external view returns (uint256) {
        return userNotes[msg.sender].length;
    }
}
